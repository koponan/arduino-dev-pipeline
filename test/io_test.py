import argparse
import unittest

from dataclasses import dataclass

from serial import Serial

@dataclass
class SerialClient:
    serial: Serial

    def readline(self) -> str:
        line = self.serial.readline().decode("ascii")
        return line.replace("\r", "")

    def write(self, data: str):
        self.serial.write(bytes(data, encoding="ascii"))

class IoTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        args = parse_args()
        ser = Serial(args.port, args.bps, timeout=args.timeout)
        cls.client = SerialClient(ser)

    def test_1_handshake(self):
        hello = self.__class__.client.readline()
        self.assertEqual(hello, "Serial ready\n")

    def test_2_temperature(self):
        self.__class__.client.write("T\n")
        t = self.__class__.client.readline()
        self.assertEqual(t, "25.00\n")

    def test_3_humidity(self):
        self.__class__.client.write("H\n")
        h = self.__class__.client.readline()
        self.assertEqual(h, "40.00\n")

    def test_4_unsupported(self):
        self.__class__.client.write("X\n")
        res = self.__class__.client.readline()
        self.assertEqual(res, "Syntax error\n")

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=str, default="/dev/ttyACM0")
    parser.add_argument("--bps", type=int, default=9600)
    parser.add_argument("--timeout", type=int, default=5)
    return parser.parse_args()

if __name__ == "__main__":
    unittest.main(verbosity=3)
