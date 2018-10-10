/**
 * Redis Configuration.
 */
$conf['chq_redis_cache_enabled'] = TRUE;
if (isset($conf['chq_redis_cache_enabled']) && $conf['chq_redis_cache_enabled']) {
  $settings['redis.connection']['interface'] = 'PhpRedis';
  $settings['cache']['default'] = 'cache.backend.redis';
  // Note that unlike memcached, redis persists cache items to disk so we can
  // actually store cache_class_cache_form in the default cache.
  $conf['cache_class_cache'] = 'Redis_Cache';
}