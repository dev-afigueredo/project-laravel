var staticCacheName = "pwa-v" + new Date().getTime();
var filesToCache = [
    'public/img/icons/smart-drogaria-saude-72x72.png',
    'public/img/icons/smart-drogaria-saude-96x96.png',
    'public/img/icons/smart-drogaria-saude-128x128.png',
    'public/img/icons/smart-drogaria-saude-144x144.png',
    'public/img/icons/smart-drogaria-saude-152x152.png',
    'public/img/icons/smart-drogaria-saude-192x192.png',
    'public/img/icons/smart-drogaria-saude-384x384.png',
    'public/img/icons/smart-drogaria-saude-512x512.png'
];

/*
// Cache on install
self.addEventListener("install", event => {
    this.skipWaiting();
    event.waitUntil(
        caches.open(staticCacheName)
            .then(cache => {
                return cache.addAll(filesToCache);
            })
    )
});
*/
/*
// Clear cache on activate
self.addEventListener('activate', event => {
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames
                    .filter(cacheName => (cacheName.startsWith("pwa-")))
                    .filter(cacheName => (cacheName !== staticCacheName))
                    .map(cacheName => caches.delete(cacheName))
            );
        })
    );
});*/

// Serve from Cache
self.addEventListener("fetch", event => {
    event.respondWith(
        caches.match(event.request)
            .then(response => {
                return response || fetch(event.request);
            })
            .catch(() => {
                return caches.match('offline');
            })
    )
});
