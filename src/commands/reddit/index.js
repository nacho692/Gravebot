import Promise from 'bluebird';
import _request from 'request';
const request = Promise.promisify(_request);

export default {
	reddit: (bot, msg, suffix) => {
    	const command = suffix.toLowerCase().split(' ')[0];
    	return request('https://www.reddit.com/domain/imgur.com/random.json').then(obj => bot.sendMessage(msg.channel, obj.data[0].data.children[0].data.url)));
    }
}