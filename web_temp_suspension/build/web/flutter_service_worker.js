'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "759c848e9d9ff327b32a0f9086713b0d",
"favicon.ico": "2b1f3ac67ef492bd937e1db6b2585849",
"index.html": "4819a66ec2db2d881014857780d5beb4",
"/": "4819a66ec2db2d881014857780d5beb4",
"styles.css": "63a453767590f9defcfbd1ab2c098630",
"main.dart.js": "f189c507bd2b3169cda0a64e63431180",
"icons/192x192.png": "5d8ef187bacf19beeed08af9e18c80f2",
"icons/favicon.png": "058d31a76cbd930452db2b520414c069",
"icons/512x512.png": "ccb7048204c1f91d414d6bef330dcf80",
"manifest.json": "12a95d0d9aef72bba38ea7c8bf4b5bb0",
"assets/AssetManifest.json": "b9878d58f4e46a6e845e2d5c9046358f",
"assets/NOTICES": "548dd2de15118818d940aba9f414ed2e",
"assets/FontManifest.json": "53289d0bfac39630efcec3795098e04b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/images/logo_img.svg": "ff2e321ea23ee520e4bc07d23240a24c",
"assets/assets/images/stop_img2.svg": "940b6ead198f7d77f69a3465dd5f7f8d",
"assets/assets/images/line_img.svg": "6a9571a8ed93ee5ec8b6b84cdd5508be",
"assets/assets/fonts/noto_sans_kr/NotoSansKR-Light.otf": "e914a10a1bd0088fb8f743fc7569749f",
"assets/assets/fonts/noto_sans_kr/NotoSansKR-Bold.otf": "e2406ff1791c401bc93e73d9e44e6d2b",
"assets/assets/fonts/noto_sans_kr/NotoSansKR-Thin.otf": "277434d967d5f33b857fc3f2dbaff15b",
"assets/assets/fonts/noto_sans_kr/NotoSansKR-Black.otf": "05c077164c27fa722dcafe63ed38355e",
"assets/assets/fonts/noto_sans_kr/NotoSansKR-Medium.otf": "32666ae307200b0bcab5553590672bb1",
"assets/assets/fonts/noto_sans_kr/NotoSansKR-Regular.otf": "210989664066c01d8ffdbdf56bb773cd",
"assets/assets/fonts/g_market_sans/GmarketSansTTFLight.ttf": "12bd3606ebae38deac6acbad730e4291",
"assets/assets/fonts/g_market_sans/GmarketSansTTFBold.ttf": "7cf85dc71a5acc06eb84b647fcab6103",
"assets/assets/fonts/g_market_sans/GmarketSansTTFMedium.ttf": "96b4a5b8dfa689a32dd322793d660298",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoH.ttf": "ee2dab186809a3df292bd2297739c6c3",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoM.ttf": "3a44ffb1539dbcfce07e73ce69ea55de",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoL.ttf": "b07ac29c8c063198e384a69bfe91c975",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoSB.ttf": "8683b84b58121f0dc4070ed892d02614",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoEB.ttf": "eaafc4677b0f252b3404c5268e0eb26d",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoUL.ttf": "fa20f8e0f9a1cce5284e24efbc1e6d14",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoB.ttf": "018066fbccbce3cc4bbba5d3ac4f1033",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoT.ttf": "c86faaf0dfc0eecd7d3fb29a684f9706",
"assets/assets/fonts/apple_gothic/AppleSDGothicNeoR.ttf": "85ba110e6b8d4c2e961f21ef648d27ea",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
