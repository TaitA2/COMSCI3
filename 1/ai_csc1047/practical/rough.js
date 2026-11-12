import { pipeline } from '@huggingface/transformers';

const classifier = await pipeline('sentiment-analysis', 'Xenova/distilbert-base-uncased-finetuned-sst-2-english', { dtype: 'q8' });
const result = await classifier('The product was great, but shipping was slow.');
console.log(result); // e.g. [{ label: 'POSITIVE', score: 0.99 }]

