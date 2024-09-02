setenv LM_LICENSE_FILE 1717@Neptune:27020@Neptune



setenv DW_LICENSE_FILE 27020@172.31.251.22
setenv SNPSLMD_LICENSE_FILE 27020@172.31.251.22
# setenv UVM_HOME /DATA/installation/mentor_graphics/questa_10.3d/questasim/verilog_src/uvm-1.1d/
# setenv UVM_HOME /DATA/installation/synopsys/vcs_2020.03/vcs/Q-2020.03/etc/uvm-1.2
setenv UVM_HOME /DATA/installation/mentor_graphics/questa_10.7d/questasim/uvm-1.2
setenv MTI_VER 10.3d
setenv MTI_VCO_MODE 64


setenv QUESTA_HOME /DATA/installation/mentor_graphics/questa_10.7d
setenv MODELSIM_HOME /DATA/installation/mentor_graphics/questa_10.7d/questasim/
setenv MTI_HOME $MODELSIM_HOME
setenv PATH ${MTI_HOME}/bin:${PATH}
setenv LD_LIBRARY_PATH ${MTI_HOME}/linux_x86_64:${MTI_HOME}/linux
setenv LIBRARY_PATH ${LD_LIBRARY_PATH}
#setenv VCS_HOME /DATA/installation/synopsys/vcs_P-2019.06-SP2-3/vcs/P-2019.06-SP2-3
setenv VCS_HOME /DATA/installation/synopsys/vcs_2020.03/vcs/Q-2020.03


setenv LD_LIBRARY_PATH /usr/local/lib64:$LD_LIBRARY_PATH
setenv LD_LIBRARY_PATH /DATA/tools/riscv/riscv-isa-sim/build:$LD_LIBRARY_PATH

#setenv RISCV /home/ishita/lowrisc-toolchain-gcc
#setenv PATH $RISCV/bin:$PATH
setenv PATH $VCS_HOME/bin:$PATH
setenv PATH $UVM_HOME/bin:$PATH
setenv PATH $LD_LIBRARY_PATH/:$PATH
setenv PATH "$HOME/.local/bin:$PATH"



setenv CVA6_REPO_DIR /home/rimjhim/cva6/cva6

alias h history
setenv DESIGNWARE_HOME /home/rimjhim/amba_svt

setenv DTC /DATA/ishita/
#setenv RISCV /DATA/ishita/RISCV_TOOLS
setenv LD_LIBRARY_PATH /usr/local/lib:/lib:/lib64:$LD_LIBRARY_PATH
setenv PATH $DTC/bin:$PATH
setenv PATH $VCS_HOME/bin:$PATH
setenv PATH $UVM_HOME/bin:$PATH
setenv PATH $LD_LIBRARY_PATH/:$PATH
setenv PATH "$HOME/.local/bin:$PATH"
#setenv RISCV_GCC $RISCV/bin/riscv32-unknown-elf-gcc
setenv RISCV_GCC /usr/local/bin/riscv64-unknown-elf-gcc
# setenv RISCV_OBJCOPY $RISCV/bin/riscv32-unknown-elf-objcopy
setenv RISCV_OBJCOPY /usr/local/bin/riscv64-unknown-elf-objcopy
setenv OVPSIM_PATH /DATA/ishita/riscv-ovpsim/bin/Linux64
#setenv SPIKE_PATH $RISCV/bin
setenv SPIKE_PATH /DATA/tools/riscv/riscv-isa-sim/build

setenv PATH /DATA/tools/riscv/riscv-isa-sim/build:$PATH

