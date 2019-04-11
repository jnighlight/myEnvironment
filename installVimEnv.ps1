#Author: 	      Jacob Lites
#Function: 	    Install VIM and Vundle plugin manager onto a windows machine. Pull my personal config from github and install it
#Precondition:  Powershell 3.0 installed (this is a powershell script)
#Postcondition:	Scoop Package Manager, 7zip, git, vim all installed. Config pulled, Vundle "installed", various config folders created.

if (-Not (Get-Command scoop -errorAction SilentlyContinue)) #If scoop doesn't exist, install it
{
	iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}
scoop install 7zip #7zip is required for git
scoop install git  #git is for pulling config, and scoop needs it for updates
scoop install vim  #This is like, 90% of the reason this script exists

#If we don't have a config, download it from mah repository
if (-Not ([System.IO.File]::Exists("$ENV:UserProfile\.vimrc")))
{
	git clone https://github.com/jnighlight/myEnvironment.git
	cd myEnvironment
	git pull
	cp .vimrc "$ENV:UserProfile\.vimrc"
	cp .vsvimrc "$ENV:UserProfile\.vsvimrc" #Lets grab the visual studio config too while we're here
	cd ..
	remove-item -recurse -force myEnvironment\
}

#If Vundle's not installed, grab it
if (-Not ([System.IO.File]::Exists("$ENV:UserProfile\vimfiles\bundle\Vundle.vim")))
{
	git clone https://github.com/VundleVim/Vundle.vim.git "$ENV:UserProfile\vimfiles\bundle\Vundle.vim"
}

#If we don't have an undo folder, make one
if (-Not ([System.IO.File]::Exists("$ENV:UserProfile\vimfiles\undo")))
{
	New-Item -ItemType directory -Path "$ENV:UserProfile\vimfiles\undo"
}

# At this point, user will have to "PluginInstall" to get plugins, but latest scoop Vim package and Vundle manager will be installed
# Have some extra stuff installing scoop, 7zip and git, but...those are pretty useful utilities anyways
