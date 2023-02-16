from flask import Flask, request
from flask_restful import Resource, Api
import database
import configparser
import datetime

server = Flask(__name__)
api = Api(server)
mt=database.biblioteca()

class llibres(Resource):
    def get(self,id_llibre):
        mt.conecta()
        result=mt.cargaLlibreid(id_llibre)
        mt.desconecta()
        return result

class lli_aut(Resource):
    def get(self,id_autor):
        mt.conecta()
        result=mt.cargaLlibreAutor(id_autor)
        mt.desconecta()
        return result

class editors_all(Resource):
    def get(self):
        mt.conecta()
        result=mt.cargaEditoresAll()
        mt.desconecta()        
        return result

    def post(self):
        mt.conecta()
        result=mt.nouEditor(request.json)
        mt.desconecta()  
        return result      

class editors(Resource):
    def get(self,id_editor):
        mt.conecta()
        result=mt.cargaEditor(id_editor)
        mt.desconecta()
        return result

    def put(self,id_editor):
        mt.conecta()
        result=mt.modificaEditor(id_editor,request.json)
        mt.desconecta()

    def delete(self,id_editor):
        mt.conecta()
        result=mt.esborraEditor(id_editor)
        mt.desconecta()

api.add_resource(llibres,'/llibres/<int:id_llibre>') #GET
api.add_resource(lli_aut,'/llibres/autor/<int:id_autor>') #GET
api.add_resource(editors_all,'/editors')  #GET (llista de tots) i POST (afegir editor)
api.add_resource(editors,'/editors/<int:id_editor>')  #GET (un concret), PUT (modificar), DELETE (eliminar)

if __name__ == '__main__':
    server.run(debug=True)
