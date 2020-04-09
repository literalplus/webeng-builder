#!/usr/bin/env node

import SmeeClient from 'smee-client';
import { execFile } from 'child_process';

process.on('SIGINT', () =>process.exit());

if(!process.env.SMEE_URL || !process.env.REPO_URL) {
  console.error('Missing required environment variables');
  process.exit();
}

function executeHandlerScript() {
  const child = execFile('/home/node/on-push.sh', (error, stdout, stderr) => {
    if (error) {
      console.error('Failed to execute on-push handler', error);
      return;
    }
    console.log(stdout);
    console.error(stderr);
  });
}

function handleMessage() {
  console.log('Handling push event');
  executeHandlerScript();
}

console.info('Webeng-Builder started, cloning repo for the first time...');
executeHandlerScript();

const smee = new SmeeClient({
  source: process.env.SMEE_URL,
  target: 'should-never-be-used',
  logger: console,
});

const events = smee.start();
events.onmessage = handleMessage;

