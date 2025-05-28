import clsx from "clsx";

const Button = ({ id, title, rightIcon, leftIcon, containerClass, onClick, disabled }) => {
  return (
    <button
      id={id}
      onClick={onClick}
      disabled={disabled}
      className={clsx(
        "group relative z-10 w-fit overflow-hidden rounded-full bg-white-50 px-7 py-3 text-black",
        disabled ? "cursor-not-allowed opacity-75" : "cursor-pointer",
        containerClass
      )}
    >
      {leftIcon}

      <span className="relative inline-flex overflow-hidden font-general text-xs uppercase">
        <div className="translate-y-0 skew-y-0 transition duration-500 group-hover:translate-y-[-160%] group-hover:skew-y-12">
          {title}
        </div>
        <div className="absolute translate-y-[164%] skew-y-12 transition duration-500 group-hover:translate-y-0 group-hover:skew-y-0">
          {title}
        </div>
      </span>

      {rightIcon}
    </button>
  );
};

export default Button;
