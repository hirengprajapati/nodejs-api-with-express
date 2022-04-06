const nodemailer = require("nodemailer");
const { Op } = require('sequelize');
const sendEmail = require('_helpers/send-email');
const mailhog = require('mailhog')
const db = require('_helpers/db');

module.exports = {
    getAll,
    getById,
    create,
    update,
    delete: _delete
};

async function getAll() {
    const organizations = await db.Organizations.findAll();
    return organizations.map(x => basicDetails(x));
}

async function getById(id) {
    const organization = await getOrganization(id);
    return basicDetails(organization);
}

async function create(params) {
    const organization = new db.Organizations(params);
    // save account
    await organization.save();

    return basicDetails(organization);
}

async function update(id, params) {
    const organization = await getOrganization(id);

   // copy params to organization and save
    Object.assign(organization, params);
    organization.updated = Date.now();
    await organization.save();

    return basicDetails(organization);
}

async function _delete(id) {
    const organization = await getOrganization(id);
    await organization.destroy();
}

// helper functions

async function getOrganization(id) {
    const organization = await db.Organization.findByPk(id);
    if (!organization) throw 'Organization not found';
    return organization;
}

function basicDetails(organization) {
    const { id, name, website, created, updated } = organization;
    return { id, name, website, created, updated };
}
