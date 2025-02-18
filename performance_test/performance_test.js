import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  vus:1000,  
  iterations: 1000,
};

export default function () {
  const res = http.get('http://localhost/register');

  const success = check(res, {
    'status is 200': (res) => res.status === 200,
  });

  console.log(`Response status: ${res.status}, Success: ${success}`);

  sleep(1);
}