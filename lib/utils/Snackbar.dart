import "package:flutter/material.dart";

snackbar(BuildContext context, String text) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    ),
  );
}

snackbarError(BuildContext context, String text) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Theme.of(context).errorColor,
      ),
    ),
  );
}

snackbarUndo(BuildContext context, String text) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ),
  );
}
