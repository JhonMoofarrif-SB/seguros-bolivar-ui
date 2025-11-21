#!/usr/bin/env node

/**
 * Deploy to GitHub Pages Script
 * 
 * Despliega el sitio a GitHub Pages usando gh-pages package
 * 
 * Nota: Asegúrate de tener gh-pages instalado:
 * pnpm add -D gh-pages
 */

import { execSync } from 'child_process';
import { existsSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const rootDir = join(__dirname, '..');
const docsDir = join(rootDir, 'docs');

console.log('🚀 Deploying to GitHub Pages...\n');

// 1. Verificar que docs/ existe
if (!existsSync(docsDir)) {
  console.error('❌ ERROR: docs/ folder not found!');
  console.error('   Run "pnpm run build:site" first.\n');
  process.exit(1);
}

// 2. Verificar que gh-pages está instalado
try {
  execSync('npx gh-pages --version', { stdio: 'ignore' });
} catch (error) {
  console.log('📦 Installing gh-pages...');
  try {
    execSync('pnpm add -D gh-pages', { stdio: 'inherit' });
    console.log('   ✅ gh-pages installed\n');
  } catch (installError) {
    console.error('❌ ERROR: Failed to install gh-pages');
    console.error('   Please install manually: pnpm add -D gh-pages\n');
    process.exit(1);
  }
}

// 3. Deploy usando gh-pages
console.log('📤 Deploying to GitHub Pages...');
console.log('   This may take a few minutes...\n');

try {
  execSync('npx gh-pages -d docs -m "Deploy: Update site and Storybook"', {
    cwd: rootDir,
    stdio: 'inherit'
  });
  
  console.log('\n✨ Deployment successful!\n');
  console.log('📍 Your site will be available at:');
  console.log('   https://YOUR-USERNAME.github.io/YOUR-REPO/');
  console.log('   (Replace with your actual GitHub username and repository name)\n');
  console.log('📖 Storybook will be at:');
  console.log('   https://YOUR-USERNAME.github.io/YOUR-REPO/storybook/\n');
  console.log('⏱️  Note: It may take a few minutes for changes to appear.\n');
  
} catch (error) {
  console.error('\n❌ Deployment failed!');
  console.error('   Make sure you have:');
  console.error('   1. Initialized git: git init');
  console.error('   2. Added remote: git remote add origin <your-repo-url>');
  console.error('   3. Committed your changes');
  console.error('   4. Have push permissions to the repository\n');
  process.exit(1);
}

