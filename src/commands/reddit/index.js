import Promise from 'bluebird';
import _request from 'request';
const request = Promise.promisify(_request);

export default {
	reddit: (bot, msg, suffix) => {
    	const command = suffix.toLowerCase().split(' ')[0];
    	return request('www.reddit.com/r/random.json').then(data => bot.sendMessage(msg.channel, data));
    }
}