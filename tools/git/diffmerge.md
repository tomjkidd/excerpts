# Windows Diff/Merge Tools

# diffmerge
When I installed git on Windows, it installed MINGW64 to support using git bash. I encountered a simple Diff/Merge tool called [DiffMerge](https://sourcegear.com/diffmerge/downloads.php), where I had to get the commands just right to configure git's global options. I added the last one so that backup files are not kept after merges.

[gitconfig for diffmerge](./.gitconfig.diffmerge)

# kdiff3
After getting diffmerge working, I was curious about setting up another tool just to say that I did.

[gitconfig for kdiff3](./.gitconfig.kdiff3)


## Testing that configs work

Because it wasn't quite as simple as performing the git operations that I already know, I also include commands used to verify that my setup was working.

### Create a repo (from a console)

    git init to-delete
    
### Create a clone (from a different console)

    git clone file:///c/users/tkidd/github/to-delete
    
### Switch to a branch (so that clone can do push without closing console)

    git checkout -b newbranch
    
### Switch back to master

    git checkout master
