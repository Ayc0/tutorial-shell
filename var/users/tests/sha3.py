import hashlib

hash = hashlib.sha3_256()
hash.update("I am a bit".encode("utf-8"))
hash.update(" of random text".encode("utf-8"))

hash.hexdigest()
