# constantly rsync rhino ~/figs to local ~/figs to see updated plots

watch -n2 rsync -a kessler@rhino:/home/kessler/figs/ /home/kessler/local_figs
