import 'dart:io';

String _getEnvString(String key) => Platform.environment[key]
    ?? (throw 'Environment variable $key is required but not set');

int _getEnvInt(String key) => int.tryParse(_getEnvString(key))
    ?? (throw 'Environment variable $key is required but not set');

final int magnoliaApiServerPort = _getEnvInt('MAGNOLIA_API_SERVER_PORT');
final String magnoliaApiAuthorizationToken = _getEnvString('MAGNOLIA_API_AUTHORIZATION_TOKEN');

final String supabaseUrl = _getEnvString('SUPABASE_URL');
final String supabaseApiKey = _getEnvString('SUPABASE_API_KEY');

final String discordOAuth2RedirectUrl = _getEnvString('DISCORD_OAUTH2_REDIRECT_URL');
final String discordOAuth2ClientId = _getEnvString('DISCORD_OAUTH2_CLIENT_ID');
final String discordOAuth2ClientSecret = _getEnvString('DISCORD_OAUTH2_CLIENT_SECRET');
final String discordBotToken = _getEnvString('DISCORD_BOT_TOKEN');
final String discordServerGuildId = _getEnvString('DISCORD_SERVER_GUILD_ID');
final String discordServerGuildUnverifiedRoleId = _getEnvString('DISCORD_SERVER_GUILD_UNVERIFIED_ROLE_ID');
final String discordServerGuildVerifiedRoleId = _getEnvString('DISCORD_SERVER_GUILD_VERIFIED_ROLE_ID');
