interface Option {
  value: string | number;
  label: string;
}

interface SelectProps {
  options: Option[];
  value: string | number;
  onChange: (value: string | number | undefined) => void;
  name?: string;
  disabled?: boolean;
  className?: string;
  required?: boolean;
  placeholder?: string;
  style?: React.CSSProperties;
}

function Select({
  options,
  value,
  onChange,
  name,
  disabled,
  className,
  required,
  placeholder,
  style,
}: SelectProps) {
  const classes: string[] = [
    `text-base font-normal text-black bg-white rounded-md p-1 cursor-pointer border border-[#848484] focus:outline-none  transition-all duration-200
    lg:text-[20px]`,
  ];
  const customStyle: React.CSSProperties = {};

  const allClasses = classes.join(" ") + (className ? ` ${className}` : "");
  return (
    <select
      name={name}
      value={value}
      onChange={(e) => onChange(e.target.value)}
      disabled={disabled}
      className={allClasses}
      required={required}
      style={{ ...customStyle, ...style }}
    >
      {placeholder && (
        <option value="" disabled>
          {placeholder}
        </option>
      )}
      {options.map((opt) => (
        <option key={opt.value} value={opt.value}>
          {opt.label}
        </option>
      ))}
    </select>
  );
}

export default Select;
