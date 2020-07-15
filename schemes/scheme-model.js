const db = require('../data/db-config');

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
  addStep,
};

function find() {
  return db('schemes');
}

function findById(id) {
  return db('schemes').where({ id }).first();
}

function findSteps(id) {
  return db('steps')
    .where('scheme_id', id)
    .join('schemes', 'steps.scheme_id', 'schemes.id')
    .select(
      'schemes.id',
      'schemes.scheme_name',
      'steps.step_number',
      'steps.instructions',
    )
    .orderBy('steps.step_number');
}

function add(scheme) {
  return db('schemes')
    .insert(scheme, 'id')
    .then(([id]) => {
      return findById(id);
    });
}

function update(changes, id) {
  return db('schemes')
    .where({ id })
    .update(changes)
    .then(() => {
      return findById(id);
    });
}

function remove(id) {
  return db('schemes')
    .where({ id })
    .del()
    .then((deleted) => {
      return deleted;
    });
}

function addStep(step, id) {
  return db('steps')
    .insert(step, 'id')
    .then((ids) => {
      return findById(ids[0]);
    });
}
