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
```sudo apt-get install bumblebee bumblebee-nvidia primus linux-headers-generic mesa-utils -y```  

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

At this time, jakeday-linux-surface has not published the solution for acpi issue, which once being resolved, the fan of dGPU and battery status should have run normally.  

After rebooting, type ```nvidia-smi``` to check if your GPU is running.(showing)
If it is, check if it is running on 3W. If so, Congratulations!  

Now, you can run ```optirun <program>``` to let your program run off nvidia dGPU. By checking with ```nvidia-smi```, you will see its power usage goes up.  
* ie. Try to run ```optirun glxgears``` and check with ```nvidia-smi```. You should be able to see dGPU power stage goes from P8 to P4 or P0.  

By terminating the program, the power goes back to idle state. (2-3W)  

If dGPU is still running on 23-35W, something is wrong.  



* Declare: at this moment, my driver is nvidia-415 (opensource). 410 is working as well.(Tested)  
Tue Nov 20 05:12:23 2018  
+-----------------------------------------------------------------------------+  
| NVIDIA-SMI 415.13       Driver Version: 415.13       CUDA Version: 10.0     |  
|-------------------------------+----------------------+----------------------+  
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |  
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |  
|===============================+======================+======================|  
|   0  GeForce GTX 1060    Off  | 00000000:02:00.0 Off |                  N/A |  
|  0%   43C    P8     3W /  N/A |      0MiB /  6080MiB |      0%      Default |  
+-------------------------------+----------------------+----------------------+  
                                                                                 
+-----------------------------------------------------------------------------+  
| Processes:                                                       GPU Memory |  
|  GPU       PID   Type   Process name                             Usage      |  
|=============================================================================|  
|  No running processes found                                                 |  
+-----------------------------------------------------------------------------+  

* After setting up the dGPU, if you want to install cuda-toolkit, please install from PPA.  
In other words, please use ```sudo apt install nvidia-cuda-toolkit -y```.  
The Official cuda-toolkit-10 may be failed due to it will try to install official nvidia-410 driver.  

* Anaconda and Qt5: please download from the official source and install from there. Don't use ```sudo```. Otherwise, it will be installed to root user.  

Other related:  
https://github.com/Bumblebee-Project/Bumblebee/issues/971  

https://wiki.archlinux.org/index.php/bumblebee  

https://www.reddit.com/r/archlinux/comments/7fjxsv/reinstalled_bbswitch_but_the_file/  

https://github.com/Bumblebee-Project/bbswitch/issues/164  

https://wiki.ubuntu.com/Bumblebee  

https://github.com/Bumblebee-Project/Bumblebee  



### Approach 2 (not-yet-Tested)  
https://github.com/timrichardson/Prime-Ubuntu-18.04  

Related to approach2:  
https://devtalk.nvidia.com/default/topic/1032482/linux/optimus-on-ubuntu-18-04-is-a-step-backwards-but-i-found-the-first-good-solution  





