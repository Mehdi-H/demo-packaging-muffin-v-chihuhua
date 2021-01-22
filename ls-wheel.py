from zipfile import ZipFile
path = './dist/muffin_v_chihuahua-1.0-py3-none-any.whl'
print(ZipFile(path).namelist())
