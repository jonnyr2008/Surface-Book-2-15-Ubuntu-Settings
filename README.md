# Surface-Book-2-15-Ubuntu-Settings
This repo is meant to be a tutorial of how the surface book 2 dual boot system is set to make almsot everything to work.  
Along with it, this branch contains some scripts for different purposes.  

Using ```chmod +x <XXX.sh>``` to make all scripts executable.  

## The sequence of using the scripts:  
```./upug.sh``` -- ```./coding_build_install.sh``` -- ```./setting_gpu.sh``` -- ```./jakeyday_surface_install.sh```  
(credit to https://github.com/jakeday/linux-surface)  
OR  
simply:
```./setup.sh```  

After finishing above steps, run ```sudo apt-get update && sudo apt-get full-upgrade -y```  

REBOOT your SB2  

## The Rest:  
### Approach 1 (Tested, dGPU is working while using optirun to execute targets)  
Now we install and set Bumblebee  
```sudo apt-get update```  
```sudo apt-get install bumblebee bumblebee-nvidia virtualgl primus linux-headers-generic -y```  

Goto Ubuntu "Software & Updates" -- "Additional Drivers" -- check your driver is right  

follow the instructions here to make your bumblebee work:  
https://askubuntu.com/questions/1029169/bumblebee-doesnt-work-on-ubuntu-18-04/1042950#1042950  

https://bugs.launchpad.net/ubuntu/+source/bumblebee/+bug/1758243  

The difference between the two links is the "blackout-nvidia.conf" content. I would suggest to follow the one from launchpad.  
Although, disable nvidia-fallback.service may result in no such service issue, you can leave it be.

Once finish editing grub file, run sudo update-grub  

https://www.youtube.com/watch?v=8EYH4IxjizM  

* If the above steps cannot trigger bumblebee at turning on, or you encounterd with issues like "```could not insert bbswitch no such device```", (This may be caused by bbswitch is not in your modprobe.d folder)  
Run the following command:  
```printf 'start on    (runlevel [2345])\nstop on     (runlevel [016])\n' | sudo tee /etc/init/bumblebeed.override```  
(credit to: https://github.com/Bumblebee-Project/Bumblebee/issues/337)  

At this time, jakeday-linux-surface has not publish the solution for acpi issue, which once resolved, the fan of GPU and battery should have run normally.  

After rebooting, type ```nvidia-smi``` to check if your GPU is running and running on 3W. If so, Congratulations!  

Now, you can run ```optirun <program>``` to let your program run off nvidia dGPU. By checking with ```nvidia-smi```, you will see its power cosuming goes up.  

By terminating the program, the power goes back to idle state. (2-3W)  


### Approach 2 (not-yet-Tested)  
https://github.com/timrichardson/Prime-Ubuntu-18.04  

Related to approach2:  
https://devtalk.nvidia.com/default/topic/1032482/linux/optimus-on-ubuntu-18-04-is-a-step-backwards-but-i-found-the-first-good-solution  

Other related:  
https://github.com/Bumblebee-Project/Bumblebee/issues/971  



