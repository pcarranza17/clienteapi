'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Cliente extends Model {

    static get table() {
        return 'cliente'
    }

    static get createdAtColumn () {
	    return null;
	}

	static get updatedAtColumn () {
	    return null;
	}
}

module.exports = Cliente
