import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/utils/common_function.dart';
import 'package:bhadwadgita/widget/field/validator.form.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool isRequired;
  final TextEditingController? textEditingController;
  final TextInputType keyboardtype;
  final bool obscure;
  final bool? focusNode;
  final String? initialValue;
  final bool readOnly;
  final String hint;
  final String? validator;
  final int maxLine;
  final int? maxlenght;
  final Function()? ontap;
  final Function? onChanged;

  const CustomTextField({
    Key? key,
    this.onChanged,
    this.focusNode,
    this.initialValue,
    this.readOnly = false,
    this.maxLine = 1,
    required this.hint,
    this.validator,
    required this.isRequired,
    this.textEditingController,
    this.obscure = false,
    this.ontap,
    this.keyboardtype = TextInputType.text,
    this.maxlenght,
  })  : assert(
          textEditingController == null || onChanged == null,
          'Cannot provide both a TextEditingController and a OnChanged()\n',
        ),
        super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 11, bottom: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 45,
              child: Wrap(
                children: [
                  Text(
                    widget.hint,
                    style: const TextStyle(
                        color: APPCONSTANT.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  if (widget.isRequired)
                    const Text(
                      ' *',
                      style: TextStyle(
                          color: APPCONSTANT.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          ),
          TextFormField(
            controller: widget.textEditingController,
            readOnly: widget.readOnly,
            textInputAction: TextInputAction.newline,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue:
                widget.initialValue != null ? "${widget.initialValue}" : null,
            onChanged: (val) {
              if (widget.onChanged == null) {
                return;
              }
              widget.onChanged!(val);
            },
            // controller: widget.initialValue != null
            //     ? TextEditingController(text: widget.initialValue)
            //     : null,
            textCapitalization: TextCapitalization.sentences,
            maxLines: widget.maxLine,
            keyboardType: widget.validator == FormEnum.number.name ||
                    widget.validator == FormEnum.phoneNumber.name
                ? TextInputType.number
                : TextInputType.multiline,
            maxLength: widget.maxlenght,
            // readOnly: widget.readonly,
            obscureText: widget.obscure,
            // keyboardType: widget.keyboardtype,
            onTap: widget.ontap,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText:
                  camelToSentence(widget.hint), //.snakeCasetoSentenceCase(),
              //splitUnderScoreAndFormName(widget.hint),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                  width: 0,
                ),
              ),
              hintStyle: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 16,
                    color: APPCONSTANT.secondaryColor,
                  ),
              // label: Text(splitUnderScoreAndFormName(widget.hint.toString())),
            ),
            validator: (val) => textFieldValidator(
              isRequired: widget.isRequired,
              val: val.toString(),
              hint: widget.hint,
              validator: widget.validator.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
