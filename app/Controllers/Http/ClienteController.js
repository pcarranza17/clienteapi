'use strict'

const Cliente = use('App/Models/Cliente');
const DB = use('Database');
const { validateAll } = use('Validator')

class ClienteController {

    async index ({ request, response }) {
        return await Cliente.all();
    }

    async store({ request, response }){
        const data = request.all();

        const rules = {
            nombre: 'required',
            apellido: 'required',
            fecha_nacimiento: 'required|dateFormat:YYYY-MM-DD'
        }

        const messages =  {
            'nombre.required': 'Nombre es requerido',
            'apellido.required': 'Apellido es requerido',
            'fecha_nacimiento.required': 'Fecha de nacimiento es requerido',
            'fecha_nacimiento.dateFormat': 'Fecha de nacimiento no tiene formato esperado',
        }

        const validation = await validateAll(request.all(), rules, messages)

        if (validation.fails()) {
            return response.status(400).json({
                errors: validation.messages()
            });
        }

        try{
            let oCliente = await Cliente.create({
                nombre: data.nombre,
                apellido: data.apellido,
                fecha_nacimiento: data.fecha_nacimiento
            });
            
            return oCliente;
        }catch(err){
            return response.status(500).json({
                error: err.message 
            });
        }
    }

    async report({request, response}){
        const calculos = await Cliente.query()
                        .select(
                            DB.raw('AVG(edad) as edad'),
                            DB.raw('STD(edad) as desviacion')
                        ).fetch();
        return calculos;
    }

}

module.exports = ClienteController
