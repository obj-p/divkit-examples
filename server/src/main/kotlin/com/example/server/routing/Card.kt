package com.example.server.routing

import divkit.dsl.Url
import divkit.dsl.aspect
import divkit.dsl.column
import divkit.dsl.data
import divkit.dsl.divan
import divkit.dsl.image
import divkit.dsl.singleRoot
import divkit.dsl.text
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.get

val card = divan {
    data(
        logId = "my-layout-id",
        states = singleRoot(
            div = column(
                items = listOf(
                    text("Hello, world!", fontSize = 18),

                    image(
                        imageUrl = Url.create("https://yastatic.net/s3/home/divkit/wombat.jpg"),
                        aspect = aspect(ratio = 1.0)
                    )
                )
            )
        )
    )
}

fun Route.getCard() {
    get("/card") {
        call.respond(card)
    }
}
