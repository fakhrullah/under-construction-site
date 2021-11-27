#!/usr/bin/env node

const {template} = require('lodash')
const fs = require('fs')
const path = require('path')

const [,, fromTeam, pageType] = process.argv;

console.log(fromTeam, '---', pageType)

if (!fromTeam) throw new Error('fromTeam is required')
if (!pageType) throw new Error('pageType is required')

let filename = './work-in-progress.html';

if (pageType === 'backsoon') filename = './we-will-back-soon.html'

const fileData = fs.readFileSync(path.join(__dirname, filename))

const compiler = template(fileData.toString());
const compiledData = compiler({
  fromTeam
});

fs.mkdirSync(path.join(__dirname, '../build'))
fs.writeFileSync(path.resolve(__dirname, '../build/index.html'), compiledData)