import glob from 'glob';
import R from 'ramda';


const glob_options = {
  realpath: true,
  nodir: true
};

const command_files = R.flatten([
  glob.sync(`${__dirname}/*(!(index.js|helpers.js))`, glob_options),
  glob.sync(`${__dirname}/*/index.js`, glob_options),
  glob.sync(`${__dirname}/*/*/index.js`, glob_options),
  glob.sync(`${__dirname}/*(!(help|config))/*.js`, glob_options)
]);

// Merge all the commands objecs together and export.
const commands = R.mergeAll(R.map(js_path => {
  return require(js_path).default;
}, command_files));

export default commands;
