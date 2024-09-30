package com.example.server.routing

import divkit.dsl.Url
import divkit.dsl.column
import divkit.dsl.data
import divkit.dsl.divan
import divkit.dsl.edgeInsets
import divkit.dsl.image
import divkit.dsl.singleRoot
import divkit.dsl.text
import divkit.dsl.wrapContentSize
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.get

val card = divan {
    data(
        logId = "my-layout-id",
        states = singleRoot(
            div = column(
                width = wrapContentSize(),
                height = wrapContentSize(),
                margins = edgeInsets(left = 10, right = 10, top = 5, bottom = 5),
                items = listOf(
                    text("Hello, world!", fontSize = 18),
                    image(Url.create("https://my-image-link"))
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
