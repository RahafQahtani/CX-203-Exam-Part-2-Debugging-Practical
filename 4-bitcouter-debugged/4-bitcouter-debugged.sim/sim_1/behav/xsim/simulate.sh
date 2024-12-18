#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Tue Dec 10 10:23:18 +03 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim tb_4_bitcount_behav -key {Behavioral:sim_1:Functional:tb_4_bitcount} -tclbatch tb_4_bitcount.tcl -view /home/it/chip_design/commoncore/digitaldesign/cx-203-debugging-exam-main/4-bitcouter-debugged/tb_4_bitcount_behav.wcfg -log simulate.log"
xsim tb_4_bitcount_behav -key {Behavioral:sim_1:Functional:tb_4_bitcount} -tclbatch tb_4_bitcount.tcl -view /home/it/chip_design/commoncore/digitaldesign/cx-203-debugging-exam-main/4-bitcouter-debugged/tb_4_bitcount_behav.wcfg -log simulate.log

