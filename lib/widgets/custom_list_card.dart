import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/pages/detais_page.dart';
import 'package:movie_app/utils/apis_utils.dart';

class CustomListCard extends StatelessWidget {
  const CustomListCard({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsPage(movie: movie),
            fullscreenDialog: true,
          ),
        );
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Hero(
                tag: movie.id,
                child: Image.network(
                  API.requestImg(movie.posterPath),
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;
                    return const CircularProgressIndicator.adaptive();
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const Spacer(),
                    Text("Popularidade: " + movie.popularity.toString()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Votos: " + movie.voteAverage.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
