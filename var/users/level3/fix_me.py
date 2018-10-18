importt hashlib

hash = hashlib.md5()
hash.updte("No one expects".encode("utf-8")
hah.update(" the spanish inquisition".encode("utf-8"))

print hash.hexdigest()
