def beautifyFetchAll(array1, array2):
    return [dict(zip(array1, element)) for element in array2]

def beautifyFetchOne(array1, array2):
    return dict(zip(array1, array2))

