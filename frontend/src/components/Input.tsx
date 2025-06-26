import { colors } from "../theme/theme";

type ThemeColor = keyof typeof colors;

interface Props {
  type?: "text" | "button" | "password";
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  required?: boolean;
  disabled?: boolean;
  backgroundColor?: ThemeColor;
  className?: string;
  name: string;
  autocomplete: string;
  style?: React.CSSProperties;
}

function Input({
  type,
  backgroundColor,
  className,
  value,
  onChange,
  placeholder,
  required,
  disabled,
  name,
  autocomplete,
  style,
}: Props) {
  const classes: string[] = [
    `py-2 px-4 rounded-4xl focus:outline-purple-600 transition-all transform text-base lg:text-[20px]`,
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
      value={value}
      onChange={(e) => onChange(e.target.value)}
      placeholder={placeholder}
      type={type}
      className={allClasses}
      required={required}
      disabled={disabled}
      name={name}
      autoComplete={autocomplete}
      style={{ ...customStyle, ...style }}
    />
  );
}

export default Input;
