import fetch from 'node-fetch';

export default {
	reddit: (bot, msg, suffix) => {
    	const command = suffix.toLowerCase().split(' ')[0];
    	return fetch('https://www.reddit.com/domain/imgur.com/random.json').then(resp => resp.json()).then(json => bot.sendMessage(msg.channel, JSON.stringify(json)));
    }
}