####################################################################### (c) KB 2013 ###########################
##
## Einf?hrung in das empirisch-wissenschaftliche Arbeiten f?r Nebenfachstudierende
## ?bung zur Vorlesung
##
## Auswertungsskript Experiment WRIntensitaet - Auswertung aller VP
##
## Hinweise zur Datenkodierung
##---------------------------------------
## reiz: hell vs. dunkel
## rtime in ms
## quali: 0=falsch, 1=richtig
##
## Hinweis: Sie m?ssen in Zeile 51 den Pfad zu Ihrem Datensatz anpassen!!!
###############################################################################################################

## diverse Balken in Abbildung zeichnen
B.zeichnen <- function(xwerte=NULL, mittelwerte=NULL, obereGrenze=NULL, untereGrenze=NULL, ... ){
    ## von oG bis kurz vor MW
    segments( xwerte, obereGrenze, xwerte, mittelwerte+.02, ...  )
    ## von uG bis kurz vor MW
    segments( xwerte, untereGrenze, xwerte, mittelwerte-.02, ...  )
    ## oG quer
    segments( xwerte-.05, obereGrenze, xwerte+.05, obereGrenze, ...  )
    ## uG quer
    segments( xwerte-.05, untereGrenze, xwerte+.05, untereGrenze, ...  )
}

## Ergebnisdatei einlesen
##-------------------------
#daten.vp<-read.table("d:\\users\\sven\\Dropbox\\Lehre\\ss13\\Einf.in.emp.-wiss.ArbeitenNF\\Experimente\\wrintensitaet\\ergebnisse\\wrintensitaet_gesamt.dat", header=T) ## ANPASSEN!
daten.vp<-read.table("C:\\Users\\Marco2020\\Dropbox\\EmpiricalResearch\\marcokuehne.github.io\\wrintensitaet_gesamt.dat", header=T) ## ANPASSEN!

## Plausibilit?tscheck
summary(daten.vp)

## Variable mit allen Versuchspersonennummern
VPNR <- unique(daten.vp$vpnr)

## Darstellung der Daten pro Versuchsperson
##---------------------------------------------

    par(mfrow=c(1,2), mar=c(0,0,0,0), oma=c(5,5,5,5))
    ## relative H?ufigkeit korrekt
    for( i in VPNR ){
        plot( quali~reiz.2, data=subset(daten.vp, vpnr==i), xlim=c(.5,2.5), ylim=c(0,1), axes=F, ann=F, col=i, lty=trunc((i%%100)/9)+1, lwd=3, type='b' )
        if(i < max(VPNR)){par(new=T, ann=F)}
    }
    box(lwd=2)
    ## Achsen
    axis(1, at=c(1:2), labels=c("hell","dunkel"), lwd=0, lwd.ticks=2, font=2)
    axis(2, at=seq(0,1,.1), labels=seq(0,1,.1), lwd=0, lwd.ticks=2, font=2, las=1)
    ## Legende
    legend( 1.5, .3, legend=paste("VP ", VPNR, sep=''), ncol=6, xjust=.5, yjust=.5, col=VPNR, lwd=2, lty=trunc((VPNR%%100)/9)+1, cex=.7, box.lwd=2)
    ## Reaktionszeit
    for( i in VPNR ){
        plot( rtime~reiz.2, data=subset(daten.vp, vpnr==i), xlim=c(.5,2.5), ylim=c(150,600), axes=F, ann=F, col=i, lty=trunc((i%%100)/9)+1, lwd=3, type='b' )
        if(i < max(VPNR)){par(new=T, ann=F)}
    }
    box(lwd=2)
    ## Achsen
    axis(1, at=c(1:2), labels=c("hell","dunkel"), lwd=0, lwd.ticks=2, font=2)
    axis(4, at=seq(150,600,50), labels=seq(150,600,50), lwd=0, lwd.ticks=2, font=2, las=1)
    
    ## Abbildungsbeschriftung
    mtext("Reiztyp", side=1, outer=T, line=3, font=2, cex=1.1) 
    mtext("relative H?ufigkeit (korrekt)", side=2, outer=T, line=3, font=2, cex=1.1) 
    mtext("Reaktionszeit", side=4, outer=T, line=3, font=2, cex=1.1)

## Mittelung ?ber Versuchspersonen
##---------------------------------------------

    ## pro Bedingung ?ber Versuchspersonen gemittelte Daten
    #daten.m<-aggregate(rtime~reiz.2, data=daten.vp.reiz.2, mean )
    #daten.m$standardabweichung<-aggregate(rtime~reiz.2, data=daten.vp, sd )$rtime 
    #daten.m$standardfehler<-aggregate(rtime~reiz.2, data=daten.vp, sd )$rtime / sqrt(length(VPNR)) 
    
    library(tidyverse)
    daten.m <- daten.vp %>%
        group_by(reiz.2) %>%
        summarize(rtime_mean = mean(rtime),
                  rtime_sd = sd(rtime),
                  rtime_se = rtime_sd / sqrt(length(VPNR)))
    
    ## Grafische Darstellung der Mittelwerte
    plot( rtime_mean~reiz.2, data=daten.m, ann=F, axes=F, type='b', lwd=4, xlim=c(.5,2.5), ylim=c(300,500))
    box(lwd=2)
    ## Achsen
    axis(1, at=c(1:2), labels=c("hell","dunkel"), lwd=0, lwd.ticks=2, font=2)
    axis(2, at=seq(300,500,25), labels=seq(300,500,25), lwd=0, lwd.ticks=2, font=2, las=1)
    ##Abbildungsbeschriftung
    mtext("Reiztyp", side=1, outer=F, line=3, font=2, cex=1.1) 
    mtext("Reaktionszeit", side=2, outer=F, line=3, font=2, cex=1.1)
    mtext("Experiment WRIntensität", side=3, outer=F, line=2, font=2, cex=1.1) 
    
    ## Grafische Darstellung der Mittelwerte und Standardfehler
    plot( rtime_mean~reiz.2, data=daten.m, ann=F, axes=F, type='b', lwd=4, xlim=c(.5,2.5), ylim=c(300,500))
    ki.zeichnen(xwerte=daten.m$reiz.2, mittelwerte=daten.m$rtime_mean, 
                obereGrenze=daten.m$rtime_mean+daten.m$rtime_sd, 
                untereGrenze=daten.m$rtime_mean-daten.m$rtime_sd, lwd=4)
    box(lwd=2)
    ## Achsen
    axis(1, at=c(1:2), labels=c("hell","dunkel"), lwd=0, lwd.ticks=2, font=2)
    axis(2, at=seq(300,500,25), labels=seq(300,500,25), lwd=0, lwd.ticks=2, font=2, las=1)
    ##Abbildungsbeschriftung
    mtext("Reiztyp", side=1, outer=F, line=3, font=2, cex=1.1) 
    mtext("Reaktionszeit", side=2, outer=F, line=3, font=2, cex=1.1)
    mtext("Experiment WRIntensit?t: Mittelwert und Standardfehler", side=3, outer=F, line=2, font=2, cex=1.1) 
