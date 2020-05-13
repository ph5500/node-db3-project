const knex = require("knex");
const knexConfig = require("../knexfile");
const db = knex(knexConfig.development);

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
};

function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes")
        .where({ id })
        .first();
}

function findSteps(id) {
    return db("steps")
        .join("schemes", "steps.scheme_id", "schemes.id")
        .select(
            "steps.id",
            "schemes.scheme_name",
            "steps.step_number",
            "steps.instructions"
        )
        .orderBy("steps.step_number")
        .where({ scheme_id: id });
}


function add(Scheme) {
    return db("schemes").insert(scheme, "id");
}

function addStep(stepData, id) {
    return db("steps")
        .insert(stepData)
        .where({ scheme_id: id });
}

function update(changes, id) {
    return db("schemes")
        .where({ id })
        .update(changes);
}

function remove(id) {
    return db("schemes")
        .where({ id })
        .del();
}