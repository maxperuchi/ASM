#!/bin/sh

echo ">Gerando Sujos"


if test "`whoami`" != "root" ; then
	echo "You must be logged in as root to build (for loopback mounting)"
	echo "Enter 'su' or 'sudo bash' to switch to root"
	exit
fi


echo "Compilando Bootloader"

./nasm -O0 -f bin -o bootload.bin bootload.asm || exit


echo "Compilando Kernel"

./nasm -O0 -f bin -o kernel.bin kernel.asm || exit

echo "Criando Disquete"
cp sujos.flp sujos.dmg


echo "Copiando Bootloader para o disquete"

dd conv=notrunc if=bootload.bin of=sujos.dmg || exit


echo "Copiando Kernel"

rm -rf tmp-loop

dev=`hdid -nobrowse -nomount sujos.dmg`
mkdir tmp-loop && mount -t msdos ${dev} tmp-loop && cp kernel.bin tmp-loop/

umount tmp-loop || exit
hdiutil detach ${dev}

rm -rf tmp-loop

echo "Criando ISO"

rm -f sujos.iso
mkisofs -input-charset iso8859-1 -o sujos.iso -b sujos.dmg ./ || exit

echo 'Deu!'

