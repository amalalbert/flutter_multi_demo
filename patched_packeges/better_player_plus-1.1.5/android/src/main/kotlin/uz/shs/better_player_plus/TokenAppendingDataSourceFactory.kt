package uz.shs.better_player_plus

import android.net.Uri
import androidx.media3.datasource.DataSource
import androidx.media3.datasource.DataSpec
import androidx.media3.datasource.DefaultDataSource
import androidx.media3.datasource.TransferListener

class TokenAppendingDataSourceFactory(
    private val token: String,
    private val baseFactory: DataSource.Factory
) : DataSource.Factory {

    override fun createDataSource(): DataSource {
        val upstreamDataSource = baseFactory.createDataSource()

        return object : DataSource {

            override fun addTransferListener(transferListener: TransferListener) {
                upstreamDataSource.addTransferListener(transferListener)
            }

            override fun open(dataSpec: DataSpec): Long {
                val originalUri = dataSpec.uri

                if (originalUri.getQueryParameter("token") != null) {
                    return upstreamDataSource.open(dataSpec)
                }

                val newUri: Uri = originalUri.buildUpon()
                    .appendQueryParameter("token", token)
                    .build()

                val newDataSpec = dataSpec.withUri(newUri)

                return upstreamDataSource.open(newDataSpec)
            }

            override fun read(buffer: ByteArray, offset: Int, length: Int): Int {
                return upstreamDataSource.read(buffer, offset, length)
            }

            override fun getUri(): Uri? {
                return upstreamDataSource.uri
            }

            override fun close() {
                upstreamDataSource.close()
            }
        }
    }
}