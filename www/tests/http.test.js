const app = require('../index.js');
const express = require("express").toString();

test('Test Basic Jest', async () => {
    expect(1+1).toBe(2);
  });

test('Test Express', async () => {
    expect(express).toMatch(/app.init/);
  });