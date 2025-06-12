import { colors } from "../theme/theme";

type ThemeColor = keyof typeof colors;

interface Props {
  type?: "text" | "button" | "password";
  backgroundColor?: ThemeColor;
  className?: string;
  style?: React.CSSProperties;
}

function Input({ type, backgroundColor, className, style }: Props) {
  const classes: string[] = [
    `py-2 px-4 rounded-4xl focus:outline-purple-600 transition-all transform text-base md:text-[22px]`,
  ];
  const customStyle: React.CSSProperties = {};

  // backgroundColor
  if (backgroundColor) {
    if (
      typeof backgroundColor === "string" &&
      colors.hasOwnProperty(backgroundColor)
    ) {
      customStyle.backgroundColor = colors[backgroundColor as ThemeColor];
    } else if (typeof backgroundColor === "string") {
      customStyle.backgroundColor = backgroundColor;
    }
  } else {
    customStyle.backgroundColor = "white";
  }

  const allClasses = classes.join(" ") + (className ? ` ${className}` : "");

  return (
    <input
      type={type}
      className={allClasses}
      style={{ ...customStyle, ...style }}
    />
  );
}

export default Input;
