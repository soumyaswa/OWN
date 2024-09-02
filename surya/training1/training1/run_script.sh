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

echo "run.sh | timeout --foreground 60s spike  --log-commits --log  spike.dump --isa=rv64gc +signature=spike_signature.txt +signature-granularity=4 $OUT_DIR/$1.elf"
timeout --foreground 60s spike  --log-commits --isa=rv64gc -l $OUT_DIR/$1.elf &> spike.dump



echo "run.sh | elf2hex  8  4194304 $1.elf 2147483648 > code.mem"
elf2hex  8  4194304 $1.elf 2147483648 > code.mem

cp -rf $OUT_DIR/$1.elf /home/mukesh/openpiton/piton/design/chip/tile/ariane/tmp/riscv-tests/build/isa/ 
cd $TEST_HOME
