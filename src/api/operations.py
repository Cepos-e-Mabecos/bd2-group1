def GET_ALL(definer):
    GET_ALL = (f"Select * From select_{definer}")
    return GET_ALL


def GET_SINGLE(definer, cod):
    if(isinstance(cod, int)):
        GET_SINGLE = (f"select select_{definer}({cod})")
    else:
        GET_SINGLE = (f"select select_{definer}('{cod}')")
    return GET_SINGLE

def GET_XML(definer):
    GET_XML = (f"Select select_{definer}()")
    return GET_XML

def INSERT(definer, data_json):
    INSERT = (f"call insert_{definer}('{data_json}')")
    return INSERT

def INSERT2(definer, data_json):
    INSERT2 = (f"select * from insert_{definer}('{data_json}')")
    return INSERT2
    
def UPDATE(definer, cod, data_json):
    if(isinstance(cod, int)):
        UPDATE = (f"call update_{definer}({cod},'{data_json}')")
    else:
        UPDATE = (f"call update_{definer}('{cod}','{data_json}')")
    return UPDATE


def DELETE(definer, cod):
    if(isinstance(cod, int)):
        DELETE = (f"call delete_{definer}({cod})")
    else:
        DELETE = (f"call delete_{definer}('{cod}')")
    return DELETE
