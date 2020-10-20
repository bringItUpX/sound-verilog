echo "This script take the input file wavsamples.bin. This file you have to extract from a .wav"
echo "file (mono, 16 bit, 44,1kHz), for example with a Hex Editor in that way, that you only"
echo "have the binary samples of the .wav file - without the header of the .wav file."
echo "This script translate the binary wav data to an output file with only hex values in"
echo "a ASCII File."
echo "----- run python script ..."
python3 translate_wav.py
echo "----- run xxd ..."
xxd -c 9 -g 9 fpga_sound.hex > sin1kHz1ms.hex
echo "In the output file sin1kHz1ms.hex you have manually to remove the first two colums with"
echo "an editor like kate or Notepad++ which has block editing."
