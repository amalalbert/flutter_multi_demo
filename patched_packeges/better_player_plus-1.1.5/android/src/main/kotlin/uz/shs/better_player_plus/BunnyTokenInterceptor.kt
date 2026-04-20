package uz.shs.better_player_plus

import okhttp3.Interceptor
import okhttp3.Response

class BunnyTokenInterceptor(
    private val token: String,
    private val expires: String
) : Interceptor {

    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        val originalUrl = request.url

        val path = originalUrl.encodedPath

        // Already signed → skip
        if (path.contains("bcdn_token")) {
            return chain.proceed(request)
        }

        // Build new path:
        // /videoId/segment.ts
        // → /bcdn_token=XYZ&expires=123/videoId/segment.ts
        val newPath = "/bcdn_token=$token&expires=$expires$path"

        val newUrl = originalUrl.newBuilder()
            .encodedPath(newPath)
            .build()

        android.util.Log.d("BUNNY_DEBUG", "➡️ $newUrl")

        val newRequest = request.newBuilder()
            .url(newUrl)
            .build()

        return chain.proceed(newRequest)
    }
}