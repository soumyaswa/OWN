# See LICENSE.vyoma for more details
TEST_HOME=$PWD
OUT_DIR=$PWD/work/$1
mkdir -p $OUT_DIR
rm -rf $OUT_DIR/*
cd $OUT_DIR
echo "run.sh | Running Test : $1 "

echo "run.sh | riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -DENTROPY=0x9629af2 -std=gnu99 -O2 -I$TEST_HOME/env -T$TEST_HOME/env/link.ld $TEST_HOME/directed_tests/$2/$1.S -o $OUT_DIR/$1.elf"
riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -DENTROPY=0x9629af2 -std=gnu99 -O2 -I$TEST_HOME/env -T$TEST_HOME/env/link.ld $TEST_HOME/directed_tests/$2/$1.S -o $OUT_DIR/$1.elf

echo "run.sh | riscv64-unknown-elf-objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data $OUT_DIR/$1.elf > $OUT_DIR/$1.disass"
riscv64-unknown-elf-objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data $OUT_DIR/$1.elf > $OUT_DIR/$1.disass

#echo "run.sh | timeout --foreground 60s spike  --log-commits --log  spike.dump --isa=rv64gc +signature=spike_signature.txt +signature-granularity=4 $OUT_DIR/$1.elf"
timeout --foreground 60s spike  --log-commits --log  spike.dump --isa=rv64gc +signature=spike_signature.txt +signature-granularity=4 $OUT_DIR/$1.elf

#echo "run.sh | export DESIGN_HOME=/source/riscv/lavanya/cclass_bugfree/c-class/bin"
#export DESIGN_HOME=/source/riscv/lavanya/cclass_bugfree/c-class/bin

echo "run.sh | elf2hex  8  4194304 $1.elf 2147483648 > code.mem"
elf2hex  8  4194304 $1.elf 2147483648 > code.mem

#echo "run.sh | ln -sf $DESIGN_HOME/* ."
#ln -sf $DESIGN_HOME/* .

#echo "run.sh | timeout --foreground 5m ./out +rtldump"
#timeout --foreground 5m ./out +rtldump

#echo "run.sh | head -n -4 rtl.dump > temp.dump"
#head -n -4 rtl.dump > temp.dump

#echo "run.sh | cp temp.dump rtl.dump"
#cp temp.dump rtl.dump

#echo "run.sh | diff rtl.dump spike.dump"
#diff rtl.dump spike.dump
#
#if cmp -s rtl.dump spike.dump ; then
#    touch PASSED
#    result="run.sh | $1.S | PASSED | test dir: $OUT_DIR"
#else
#    touch  FAILED
#    result="run.sh | $1.S  | FAILED | test dir: $OUT_DIR"
#fi
#echo "-------------------------------------------------------------------------"
#echo $result
#echo "-------------------------------------------------------------------------"

cp -rf $OUT_DIR/$1.elf /home/mukesh/openpiton/piton/design/chip/tile/ariane/tmp/riscv-tests/build/isa/ 
cd $TEST_HOME
