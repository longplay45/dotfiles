#!/bin/bash

echo "System-Cache leeren..."
sudo rm -rf ~/Library/Caches/*
sudo rm -rf /Library/Caches/*

echo "Protokolle löschen..."
sudo rm -rf /private/var/log/*

echo "Fertig!"