# A real R console in the reader's browser, powered by webR.
#
# webR is R itself, compiled to WebAssembly. Nothing is sent to a server: the R
# interpreter is downloaded once and then runs inside the browser tab. That is
# the difference to the old DataCamp Light boxes, which needed a service that
# no longer exists.
#
# The download is roughly 30 MB, so it is deliberately lazy: nothing happens
# until the reader presses Run for the first time on a page.
#
# Usage inside a chunk with results = "asis", echo = FALSE:
#
#   webr_console("1 + 1\n2 * 21")
#   webr_console(readLines("data/intro-r.R"), height = 260)
#   webr_console("plot(1:10)", plot = TRUE)

webr_console <- function(code = "",
                         id = paste0("webr", sample(1e5, 1)),
                         rows = NULL,
                         plot = FALSE,
                         packages = character(0),
                         hint = NULL) {

  code <- paste(code, collapse = "\n")
  if (is.null(rows)) rows <- max(3, min(14, length(strsplit(code, "\n")[[1]])))

  esc <- function(x) htmltools::htmlEscape(x)

  cat(
    '<div class="webr-box" id="', id, '"',
    ' data-plot="', tolower(as.character(plot)), '"',
    ' data-packages="', paste(packages, collapse = ","), '">\n',
    '<textarea class="webr-code" spellcheck="false" rows="', rows, '">',
    esc(code), '</textarea>\n',
    '<div class="webr-bar">\n',
    '  <button class="webr-run" type="button">Run</button>\n',
    '  <button class="webr-reset" type="button">Reset</button>\n',
    '  <span class="webr-status">R is not loaded yet</span>\n',
    '</div>\n',
    '<pre class="webr-out" hidden></pre>\n',
    if (plot) '<canvas class="webr-plot" hidden></canvas>\n' else '',
    if (!is.null(hint)) paste0('<p class="webr-hint">', esc(hint), '</p>\n') else '',
    '</div>\n',
    sep = ""
  )

  # The loader is defined once per page and shared by every box on it.
  cat('
<script>
if (!window.bfidWebR) {
  window.bfidWebR = (function () {
    var ready = null;      // promise for the webR instance
    var shelter = null;    // memory shelter, reused across runs
    var listeners = [];

    function announce(msg) { listeners.forEach(function (f) { f(msg); }); }

    function boot() {
      if (ready) return ready;
      announce("downloading R, about 30 MB - this happens once per visit");
      ready = import("https://webr.r-wasm.org/latest/webr.mjs")
        .then(async function (mod) {
          var webR = new mod.WebR();
          await webR.init();
          shelter = await new webR.Shelter();
          announce("R is ready");
          return webR;
        })
        .catch(function (e) {
          announce("R could not be loaded: " + e);
          ready = null;
          throw e;
        });
      return ready;
    }

    return {
      onStatus: function (f) { listeners.push(f); },
      run: async function (code, packages) {
        var webR = await boot();
        if (packages && packages.length) {
          announce("installing " + packages.join(", "));
          await webR.installPackages(packages);
          announce("R is ready");
        }
        var res = await shelter.captureR(code, {
          withAutoprint: true,
          captureStreams: true,
          captureConditions: false
        });
        var text = res.output
          .filter(function (o) { return o.type === "stdout" || o.type === "stderr"; })
          .map(function (o) { return o.data; })
          .join("\\n");
        return { text: text, images: res.images, purge: function () { shelter.purge(); } };
      }
    };
  })();
}

(function () {
  var box = document.getElementById("', sep = "")
  cat(id, '");
  var area = box.querySelector(".webr-code");
  var out = box.querySelector(".webr-out");
  var canvas = box.querySelector(".webr-plot");
  var status = box.querySelector(".webr-status");
  var runBtn = box.querySelector(".webr-run");
  var original = area.value;
  var pkgs = box.dataset.packages ? box.dataset.packages.split(",").filter(Boolean) : [];

  window.bfidWebR.onStatus(function (m) { status.textContent = m; });

  runBtn.addEventListener("click", async function () {
    runBtn.disabled = true;
    out.hidden = false;
    out.textContent = "running...";
    try {
      var r = await window.bfidWebR.run(area.value, pkgs);
      out.textContent = r.text || "(no output)";
      if (canvas && r.images && r.images.length) {
        var img = r.images[r.images.length - 1];
        canvas.width = img.width;
        canvas.height = img.height;
        canvas.getContext("2d").drawImage(img, 0, 0);
        canvas.hidden = false;
      }
      r.purge();
    } catch (e) {
      out.textContent = String(e && e.message ? e.message : e);
    }
    runBtn.disabled = false;
  });

  box.querySelector(".webr-reset").addEventListener("click", function () {
    area.value = original;
    out.hidden = true;
    if (canvas) canvas.hidden = true;
  });
})();
</script>
', sep = "")

  invisible(NULL)
}
