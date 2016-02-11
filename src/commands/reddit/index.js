import Promise from 'bluebird';
import _request from 'request';
const request = Promise.promisify(_request);

export default {
	reddit: (bot, msg, suffix) => {
    	const command = suffix.toLowerCase().split(' ')[0];
    	return request('https://www.reddit.com/domain/imgur.com/random.json').then(data => bot.sendMessage(msg.channel, JSON.stringify(data[0].data)));
    }
}