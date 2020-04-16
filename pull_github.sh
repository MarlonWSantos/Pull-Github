##!/usr/bin/env bash
#
#
#
#   Pull Github - Download automatic of github repository 
#   Copyright (C) 2020 Marlon W. Santos <marlon.santos.santos@icen.ufpa.br>
#
#
#	
#   This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>


 #Save the URL repository
function save_URL(){
 URLRepository=$1
 echo $1
}

 #Save the name of repository
function get_Name_Repository(){
 nameRepository=`echo $URLRepository | sed 's;^.*/;;' | sed 's;.git;;'`  
}

 #Create a local repository
function create_Repository(){
 mkdir $nameRepository &&
 cd $nameRepository
}

 #Do the download from the github
function download_Repository(){
 git init &&
 git remote add origin $URLRepository &&
 git remote -v &&
 git pull origin master
}

 #Call to functions
save_URL $1

get_Name_Repository

create_Repository

download_Repository
