import binascii as lls

fout = open("fpga_sound.hex", "wb")
index=0
with open("wavsamples.bin", "rb") as fin:
	first = fin.read(1)
	while first:
		second = fin.read(1)
		fout.write(lls.hexlify(second))
		fout.write(lls.hexlify(first))
		fout.write(lls.hexlify(second))
		fout.write(lls.hexlify(first))
		first = fin.read(1)
