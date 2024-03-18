def get_value_from_nested_object(obj, key):
    keys = key.split('/') 
    current_obj = obj

   
    for k in keys:
        if k in current_obj:
            current_obj = current_obj[k]
        else:
            return None 

    return current_obj  




if __name__ == "__main__":
    obj1 = {"a": {"b": {"c": {"d" : "e"}}}}
    key1 = "a/b/c"
    value = get_value_from_nested_object(obj1,key1)
    print(value)
    
    
